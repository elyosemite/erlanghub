-module(drop).
-export([fall_velocity/2]).

fall_velocity(Planemo, Distance) when Distance >= 0 ->
    case Planemo of
        earth -> math:sqrt(2 * 9.8 * Distance);
        moon -> math:sqrt(2 * 1.625 * Distance);
        mars -> math:sqrt(2 * 3.711 * Distance)
    end.
