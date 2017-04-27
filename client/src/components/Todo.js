import React, {PropTypes} from 'react';
import classNames from 'classnames';

const Todo = ({onClick, completed, text}) => {
  const textClass = classNames({
    text: true,
    'text-line-through': completed
  });

  return (
    <li
      onClick={onClick}
      className={textClass}>
      {text}
    </li>
  );
};

Todo.propTypes = {
  onClick: PropTypes.func.isRequired,
  completed: PropTypes.bool.isRequired,
  text: PropTypes.string.isRequired
};

export default Todo;



