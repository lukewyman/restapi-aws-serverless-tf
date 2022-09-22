import sys 
import logging 
import traceback 
import json
import uuid
import os 
import boto3


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()


def create_todo_list(todo_list):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['TODO_LISTS_TABLE_NAME'])

    response = table.put_item(Item=todo_list)

    return response.get('Attributes')


def handler(event, context):
    logger.info(f'event: {event}')

    event_body = json.loads(event['body'])
    list_name = event_body['list_name']
    description = event_body['description']
    
    todo_list = {}
    todo_list['list_name'] = list_name
    todo_list['description'] = description
 
    response = {}
    response['headers'] = {}
    response['headers']['Content-Type'] = 'applicaton/json'

    try:
        dynamo_response = create_todo_list(todo_list)
        logger.info(f'DynamoDB Response: {dynamo_response}')
    except Exception as e:
        exception_type, exception_value, exception_traceback = sys.exc_info()
        traceback_string = traceback.format_exception(exception_type, exception_value, exception_traceback)
        err_msg = json.dumps({
            "errorType": exception_type.__name__,
            "errorMessage": str(exception_value),
            "stackTrace": traceback_string
        })
        logger.error(err_msg)
        
        response['statusCode'] = 500
        response['body'] = err_msg
    else:
        response['statusCode'] = 201 
        response['body'] = json.dumps(todo_list)

    return response