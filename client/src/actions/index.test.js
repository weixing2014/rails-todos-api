import { actions, actionTypes, filterTypes } from './index';

describe('ActionCreators', () => {
  it('has addTodo', () => {
    expect(actions.addTodo('Lady Gaga')).toEqual({
      type: actionTypes.ADD_TODO,
      text: 'Lady Gaga'
    });
  });

  it('has toggleTodo', () => {
    expect(actions.toggleTodo(1)).toEqual({
      type: actionTypes.TOGGLE_TODO,
      id: 1
    });
  });

  it('has setVisibilityFilter', () => {
    expect(actions.setVisibilityFilter(filterTypes.ACTIVE)).toEqual({
      type: actionTypes.SET_VISIBILITY_FILTER,
      filter: filterTypes.ACTIVE
    });
  });
});

