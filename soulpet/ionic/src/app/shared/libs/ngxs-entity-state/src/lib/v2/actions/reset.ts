import { Type } from '@angular/core';
import { EntityState } from '../entity-state';
import { EntityActionType, generateActionObject } from '../internals';

export class Reset {
  /**
   * Resets the targeted store to the default state: no entities, loading is false, error is undefined, active is undefined.
   * @param target The targeted state class
   * @see defaultEntityState
   */
  constructor(target: Type<EntityState<any>>) {
    return generateActionObject(EntityActionType.Reset, target);
  }
}
