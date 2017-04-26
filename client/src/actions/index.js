export const addTodo = text => {
  return {
    type: 'ADD_TODO',
    text
  }
};

export const toggleTodo = id => {
  return {
    type: 'TOGGLE_TODO',
    id
  }
};

export const setVisibilityFilter = filter => {
  return {
    type: 'SET_VISIBILITY_FILTER',
    filter
  }
};

export const filterTypes = {
  SHOW_ALL: 'SHOW_ALL',
  ACTIVE: 'ACTIVE',
  COMPLETED: 'COMPLETED'
};

export const actionTypes = {
  ADD_TODO: 'ADD_TODO',
  TOGGLE_TODO: 'TOGGLE_TODO',
  SET_VISIBILITY_FILTER: 'SET_VISIBILITY_FILTER'
};

export const actions = {
  addTodo,
  toggleTodo,
  setVisibilityFilter
};
