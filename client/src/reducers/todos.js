const todos = (state = [], action) => {
  switch (action.type) {
    case 'ADD_TODO':
      return [
        ...state,
        {
          id: state.reduce((maxId, todo) => Math.max(todo.id, maxId), -1) + 1,
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
        } else {
          return todo;
        }
      });

    default:
      return state;
  }
};

export default todos;
