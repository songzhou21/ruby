-module(ping).
-export([main/1, start/1, pingpong/1]).

pingpong(Name) ->
    receive
        {_, 0} ->
            io:format("~s:done~n", [Name]);
        {Partner, Count} ->
            if ((Count rem 500) < 2) ->
                   io:format("~p: pingpong ~p~n", [Name, Count]);
               true -> true
            end,
            Partner ! {self(), Count -1},
            pingpong(Name)
    end.

start(N) ->
    Pong_PID = spawn(ping, pingpong, [pong]),
    Ping_PID = spawn(ping, pingpong, [ping]),
    Pong_PID ! {Ping_PID, N}.

main([A]) ->
    start(list_to_integer(atom_to_list(A))),
    init:stop().
