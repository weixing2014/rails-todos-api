import React, {PropTypes} from 'react';
import {shallow} from 'enzyme';
import Todo from './Todo';

let wrapper;

const setup = ({
  completed = false,
  text = ''
}) => {
  const actions = {
    onClick: jest.fn()
  };

  const component = shallow(<Todo {...{completed, text, ...actions}} />);

  return {
    component,
    actions
  }
};

describe('Todo Component', () => {
  it('should include text', () => {
    const {component} = setup({text: 'text'});
    expect(component.text()).toEqual('text');
  });

  it('should have style line-through if completed', () => {

  });

  it('simulates click events', () => {
    const {component, actions} = setup({});
    component.simulate('click');
    expect(actions.onClick).toBeCalled();
  });
});
