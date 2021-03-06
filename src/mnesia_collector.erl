%%======================================================================
%%
%% LeoFS Doctor
%%
%% Copyright (c) 2012-2016 Rakuten, Inc.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%
%%======================================================================
-module(mnesia_collector).

%% Module API
-export([get_data/0]).

%% =============================================================================
%% Module API
%% =============================================================================
get_data() ->
    %% system info
    SysInfo = mnesia:system_info(all),
    %% table info
    Tables = proplists:get_value(tables, SysInfo),
    TablesProplist =  [ [ {table_name, T} | mnesia:table_info(T, all) ] || T <- Tables ],
    {ok, SysInfo, TablesProplist}.
