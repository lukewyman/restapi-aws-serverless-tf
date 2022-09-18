import sys 
import logging 
import traceback 
import json
import uuid
import os 
import boto3
from botocore.exceptions import ClientError


logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()


def get_project(project_id):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['PROJECTS_TABLE_NAME'])

    try:
        response = table.get_item(Key={'project_id': project_id})
    except ClientError as e:
        logger.error(e.response['Error']['Message'])
        raise e 
    else:
        return response.get('Item')


def handler(event, context):
    project_id = event['pathParameters']['projectId']

    response = {}
    response['headers'] = {}
    response['headers']['Content-Type'] = 'application/json'

    try:
        project = get_project(project_id)
        if project is None:
            response['statusCode'] = 404
            response['body'] = json.dumps(f'Project with id {project_id} not found.')
        else:
            response['statusCode'] = 200
            response['body'] = json.dumps(project)
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