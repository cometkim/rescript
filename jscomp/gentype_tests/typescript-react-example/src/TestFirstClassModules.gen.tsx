/* TypeScript file generated from TestFirstClassModules.res by genType. */

/* eslint-disable */
/* tslint:disable */

import * as TestFirstClassModulesBS__Es6Import from './TestFirstClassModules.bs';
const TestFirstClassModulesBS: any = TestFirstClassModulesBS__Es6Import;

import type {firstClassModule as FirstClassModulesInterface_firstClassModule} from './FirstClassModulesInterface.gen';

import type {firstClassModule as FirstClassModules_firstClassModule} from './FirstClassModules.gen';

import type {record as FirstClassModulesInterface_record} from './FirstClassModulesInterface.gen';

export type firstClassModuleWithTypeEquations<i,o> = MT;

export const convert: (x:FirstClassModules_firstClassModule) => FirstClassModules_firstClassModule = TestFirstClassModulesBS.convert;

export const convertInterface: (x:FirstClassModulesInterface_firstClassModule) => FirstClassModulesInterface_firstClassModule = TestFirstClassModulesBS.convertInterface;

export const convertRecord: (x:FirstClassModulesInterface_record) => FirstClassModulesInterface_record = TestFirstClassModulesBS.convertRecord;

export const convertFirstClassModuleWithTypeEquations: <T1,T2>(x:MT) => MT = TestFirstClassModulesBS.convertFirstClassModuleWithTypeEquations;
