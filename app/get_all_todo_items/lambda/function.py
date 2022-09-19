import sys 
import logging 
import traceback 
import json
import os 
import boto3
from boto3.dynamodb.conditions import Key


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()


def get_all_todo_items(list_name):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['TODO_ITEMS_TABLE_NAME'])

    response = table.query(
        KeyConditionExpression=Key('list_name').eq(list_name)
    )

    return response['Items']


def handler(event, context):    

    response = {}
    response['headers'] = {}
    response['headers']['Content-Type'] = 'applicaton/json'

    try:
        list_name = event['pathParameters']['listName']
        items = get_all_todo_items(list_name)
        response['statusCode'] = 200
        response['body'] = json.dumps(items)
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