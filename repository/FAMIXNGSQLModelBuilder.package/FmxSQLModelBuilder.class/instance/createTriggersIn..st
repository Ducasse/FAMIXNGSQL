model building - entities
createTriggersIn: aMooseModel
	self flag: #TODO. "Firing action, when, etc..."
	metadata getTriggers do: [ :pgTrigger |
		|trigger|
		trigger := FmxSQLTrigger new
							name: pgTrigger name;
							table: (pgToFamixEntities at: pgTrigger table);
							storedProcedure: (pgToFamixEntities at: pgTrigger function);
							mooseModel: aMooseModel;
							yourself.
		pgToFamixEntities
			at: pgTrigger
			put: trigger. ]