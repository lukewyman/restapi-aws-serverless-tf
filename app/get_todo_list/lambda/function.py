import sys 
import logging 
import traceback 
import json
import uuid
import os 
import boto3
from botocore.exceptions import ClientError
from boto3.dynamodb.conditions import Key


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()


def get_todo_list(list_name):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['TODO_LISTS_TABLE_NAME'])

    try: 
        response = table.query(KeyConditionExpression=Key('list_name').eq(list_name))
    except ClientError as e:
        logger.error(e.response['Error']['Code'], e.response['Error']['Message'])
    else:
        return response['Items']
    

def handler(event, context):
    list_name = event['pathParameters']['listName']

    response = {}
    response['headers'] = {}
    response['headers']['Content-Type'] = 'application/json'

    try:
        todo_list = get_todo_list(list_name)
        if todo_list is None:
            response['statusCode'] = 404
            response['body'] = json.dumps(f'TODO List with Name {list_name} not found.')
        else:
            response['statusCode'] = 200
            response['body'] = json.dumps(todo_list)
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

    return response