%% This is the application resource file (.app file) for the 'base'
%% application.
{application, multi_service,
[{description, "multi_service  " },
{vsn, "1.0.0" },
{modules, 
	  [multi_service_app,multi_service_sup,multi_service]},
{registered,[multi_service]},
{applications, [kernel,stdlib]},
{mod, {multi_service_app,[]}},
{start_phases, []}
]}.
