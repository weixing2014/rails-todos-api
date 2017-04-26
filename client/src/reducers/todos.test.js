import reducer from './todos';

describe('todos reducer', () => {
  it('should return the initial state', () => {
    expect(reducer(undefined, {})).toEqual([]);
  });

  describe('should handle ADD_TODO', () => {
    it('should set the first todo id = 0', () => {
      expect(reducer([], {
        type: 'ADD_TODO',
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
        type: 'ADD_TODO',
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
});
