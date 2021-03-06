import reducer from './visibilityFilter';
import { actionTypes } from '../actions';

describe('visibilityFilter reducer', () => {
  it('should return the initial state', () => {
    expect(reducer(undefined, {})).toEqual('SHOW_ALL');
  });

  it('should handle SET_VISIBILITY_FILTER', () => {
    expect(reducer('SHOW_ALL', {
      type: actionTypes.SET_VISIBILITY_FILTER,
      filter: 'ACTIVE'
    })).toEqual('ACTIVE');
  });
});
