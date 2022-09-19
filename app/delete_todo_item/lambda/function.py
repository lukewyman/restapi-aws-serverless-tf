from calendar import c
import sys 
import logging 
import traceback 
import json
import uuid
import os 
import boto3
from boto3.dynamodb.conditions import Key


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()

def get_table():
    dynamodb = boto3.resource('dynamodb')
    return dynamodb.Table(os.environ['TODO_ITEMS_TABLE_NAME'])

def complete_todo_item(list_name, item_name):
    table = get_table()

    response = table.update_item(
        Key = {
            'list_name': list_name,
            'item_name': item_name
        },
        UpdateExpression = 'set completed=:c',
        ExpressionAttributeValues = {
            ':c': True 
        },
        ReturnValues = 'ALL_NEW'
    )

    return response.get('Attributes')


def get_all_todo_items(list_name):
    table = get_table()

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
        item_name = event['pathParameters']['itemName']

        completed_response = complete_todo_item(list_name, item_name)        
        logger.info(f'Complete item DynamoDB response: {completed_response}')

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