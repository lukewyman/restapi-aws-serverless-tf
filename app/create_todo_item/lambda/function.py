import sys 
import logging 
import traceback 
import json
import os 
import boto3


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()


def create_todo_item(todo_item):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['TODO_ITEMS_TABLE_NAME'])

    response = table.put_item(Item=todo_item)

    return response.get('Attributes')


def handler(event, context):
    logger.info(f'event: {event}')
    
    response = {}

    try: 
        event_body = json.loads(event['body'])

        todo_item = {}
        todo_item['list_name'] = event['pathParameters']['listName']
        todo_item['item_name'] = event_body['item_name']
        todo_item['details'] = event_body['details']
        todo_item['completed'] = False

        dynamo_response = create_todo_item(todo_item)
        logger.info(f'DynamoDB Response: {dynamo_response}')

        response['headers'] = {}
        response['headers']['Content-Type'] = 'applicaton/json'
        response['statusCode'] = 201 
        response['body'] = json.dumps(todo_item)

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
        return response

    