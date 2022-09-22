import sys 
import logging 
import traceback 
import json
import uuid
import os 
import boto3


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()


def delete_project(project_id):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['PROJECTS_TABLE_NAME'])

    response = table.delete_item(
        Key = {'project_id': project_id}
    )


def handler(event, context):
    logger.info(f'event: {event}')
    project_id = event['pathParameters']['projectId']

    response = {}
    response['headers'] = {}
    response['headers']['Content-Type'] = 'application/json'

    try:
        delete_project(project_id)
    except Exception as e:
        exception_type, exception_value, exception_traceback = sys.exc_info()
        traceback_string = traceback.format_exception(exception_type, exception_value, exception_traceback)
        err_message = json.dumps({
            'errorType': exception_type.__name__,
            "errorMessage": str(exception_value),
            "stackTrace": traceback_string
        })
        logger.error(err_message)
        
        response['statusCode'] = 500
        response['body'] = err_message
    else:
        response['statusCode'] = 204

    return response
