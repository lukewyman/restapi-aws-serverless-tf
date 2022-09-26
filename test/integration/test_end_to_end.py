import pytest
import json
import requests


@pytest.fixture
def api_endpoint():
    with open('test/integration/tf_outputs.json') as outputs_file:
        outputs = json.load(outputs_file)

    return outputs['api_url']['value']


def test_post_todo_list(api_endpoint):
    list_name = 'POST_list_name'
    description = 'Create a new todo list.'

    post_data = {
        'list_name': list_name,
        'description': description
    }

    headers = {'Content-Type': 'application/json'}
    url = f'{api_endpoint}/todo-lists'

    response = requests.post(url, data=json.dumps(post_data), headers=headers)
    body = response.json()

    assert response.status_code == 201
    assert body['list_name'] == 'POST_list_name'
    assert body['description'] == 'Create a new todo list.'


def test_post_todo_item(api_endpoint):
    list_name = 'list_name_GET'
    item_name = 'item_name_GET'
    details = 'details GET'

    post_data = {
        'item_name': item_name,
        'details': details
    }

    headers = {'Content-Type': 'application/json'}
    url = f'{api_endpoint}/todo-lists/{list_name}/todo-items'
    print(url)

    response = requests.post(url, data=json.dumps(post_data), headers=headers)
    body = response.json()

    assert response.status_code == 201
    assert body['list_name'] == list_name
    assert body['item_name'] == item_name
    assert body['details'] == details
    assert body['completed'] == False


def test_get_all_todo_items(api_endpoint):
    list_name = 'list_name_GET_ALL'

    response = requests.get(f'{api_endpoint}/todo-lists/{list_name}/todo-items')
    body = response.json()
    print(body)

    assert response.status_code == 200
    assert len(body) == 2


def test_delete_todo_item(api_endpoint):
    list_name = 'list_name_DELETE'
    item_name = 'item_name_DELETE'
    details = 'details DELETE'

    response = requests.delete(f'{api_endpoint}/todo-lists/{list_name}/todo-items/{item_name}')
    body = response.json()

    assert response.status_code == 200
    assert body[0]['list_name'] == list_name
    assert body[0]['item_name'] == item_name
    assert body[0]['details'] == details
    assert body[0]['completed'] == True