import reducer from './todos';
import {actionTypes} from '../actions';

describe('todos reducer', () => {
  it('should return the initial state', () => {
    expect(reducer(undefined, {})).toEqual([]);
  });

  describe('should handle ADD_TODO', () => {
    it('should set the first todo id = 0', () => {
      expect(reducer([], {
        type: actionTypes.ADD_TODO,
        text: 'Call Lady Gaga'
      })).toEqual([
        {
          id: 0,
          text: 'Call Lady Gaga',
          completed: false
        }
      ]);
    });

    it('should increase id by 1 every time adding a new todo', () => {
      expect(reducer([
        {
          id: 0,
          text: 'Call Lady Gaga',
          completed: false
        }
      ], {
        type: actionTypes.ADD_TODO,
        text: 'Call Lady Baba'
      })).toEqual([
        {
          id: 0,
          text: 'Call Lady Gaga',
          completed: false
        },
        {
          id: 1,
          text: 'Call Lady Baba',
          completed: false
        },
      ]);
    });
  });

  it('should handle TOGGLE_TODO', () => {
    let state = [
      {
        id: 0,
        completed: false,
        text: 'Lady Gaga'
      },
      {
        id: 1,
        completed: false,
        text: 'Lady Baba'
      }
    ];

    let nextState = [{
      id: 0,
      completed: true,
      text: 'Lady Gaga'
    }, {
      id: 1,
      completed: false,
      text: 'Lady Baba'
    }];

    let action = {
      type: actionTypes.TOGGLE_TODO,
      id: 0
    };

    expect(reducer(state, action)).toEqual(nextState);
  });
});
