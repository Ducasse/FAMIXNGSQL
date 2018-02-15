model building
buildModel
	"Build an instance of MooseModel from the connection to the database and returns it."
	| mooseModel |
	mooseModel := MooseModel new
						name: self databaseName;
						yourself.
	pgToFamixEntities := Dictionary new.
	self
		loadMetaData;
		createTypesIn: mooseModel;
		createTablesIn: mooseModel;
		createConstraintsIn: mooseModel;
		createViewsIn: mooseModel;
		createStoredProceduresIn: mooseModel;
		createTriggersIn: mooseModel.
	
	pgToFamixEntities := nil.
	
	^ mooseModel