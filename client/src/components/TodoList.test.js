import React, {PropTypes} from 'react';
import {shallow} from 'enzyme';
import TodoList from './TodoList';
import Todo from './Todo';

const setup = ({
  todos = [],
}) => {
  const actions = {
    onTodoClick: jest.fn()
  };

  const component = shallow(<TodoList todos={todos} onTodoClick={actions.onTodoClick} />);

  return {
    component,
    actions
  }
};

describe('Todo Component', () => {
  it('should include todos', () => {
    const {component, actions} = setup({
      todos: [
        {
          id: 0,
          text: '0',
          completed: false
        }, {
          id: 1,
          text: '1',
          completed: true
        }
      ]
    });

    expect(component.find(Todo).length).toEqual(2);

    expect(component.find(Todo).at(0).prop('id')).toEqual(0);
    expect(component.find(Todo).at(0).prop('text')).toEqual('0');
    expect(component.find(Todo).at(0).prop('completed')).toEqual(false);

    expect(component.find(Todo).at(1).prop('id')).toEqual(1);
    expect(component.find(Todo).at(1).prop('text')).toEqual('1');
    expect(component.find(Todo).at(1).prop('completed')).toEqual(true);
  });

  it('should trigger onTodoClick', () => {
    const {component, actions} = setup({
      todos: [
        {
          id: 0,
          text: '0',
          completed: false
        }
      ]
    });

    component.find(Todo).at(0).simulate('click');
    expect(actions.onTodoClick.mock.calls[0]).toEqual([0])
  });
});
