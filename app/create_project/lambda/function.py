import json


def create_project(project):
    pass


def handler(event, context):
    response = {}
    response['headers'] = {}
    response['headers']['statusCode'] = 200
    response['headers']['Content-Type'] = 'applicaton/json'

    response['body'] = json.dumps('Hello from CREATE-PROJECT lambda!')

    return response