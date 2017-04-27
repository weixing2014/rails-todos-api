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

  it('should have class .text-line-through if completed', () => {
    const {component} = setup({completed: true});
    expect(component.find('li').hasClass('text-line-through')).toEqual(true);
  });

  it('simulates click events', () => {
    const {component, actions} = setup({});
    component.simulate('click');
    expect(actions.onClick).toBeCalled();
  });
});
