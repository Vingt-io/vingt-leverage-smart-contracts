/*
    Copyright 2020 Set Labs Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

    SPDX-License-Identifier: Apache License, Version 2.0
*/
pragma solidity 0.6.10;

import { IERC20 } from "./IERC20.sol";

import { ISetToken } from "./ISetToken.sol";


/**
 * CHANGELOG:
 *      - Added a module level issue hook that can be used to set state ahead of component level
 *        issue hooks
 */
interface IModuleIssuanceHook {

    function moduleIssueHook(ISetToken _setToken, uint256 _setTokenQuantity) external;
    function moduleRedeemHook(ISetToken _setToken, uint256 _setTokenQuantity) external;
    
    function componentIssueHook(
        ISetToken _setToken,
        uint256 _setTokenQuantity,
        IERC20 _component,
        bool _isEquity
    ) external;

    function componentRedeemHook(
        ISetToken _setToken,
        uint256 _setTokenQuantity,
        IERC20 _component,
        bool _isEquity
    ) external;
}