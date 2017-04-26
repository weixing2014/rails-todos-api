const todo = (state = {}, action) => {
  switch (action.type) {
    case 'ADD_TODO':
      return [
        ...state,
        {
          id: action.id,
          text: action.text,
          completed: false
        }
      ];
    case 'TOGGLE_TODO':
      return state.map(todo => {
        if (todo.id === action.id) {
          return {
            id: todo.id,
            text: todo.text,
            completed: !todo.completed
          }
        }
      });

    default:
      return state;
  }
};

export default todo;
