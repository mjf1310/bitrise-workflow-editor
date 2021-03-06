export interface StepCatalouge {
	steps: Array<Map<string, Record<string, any>>>;
	latestStepVersions: Map<string, Record<string, any>>;
}
export interface Workflow {
	id: string;
	steps: Array<Step>;
	beforeRunWorkflows: (arg0: Array<Workflow>) => Array<Workflow>;
	afterRunWorkflows: (arg0: Array<Workflow>) => Array<Workflow>;
	workflowChain: (arg0: Array<Workflow>) => Array<Workflow>;
}

export interface Step {
	id: string;
	cvs: string;
	version: string;
	requestedVersion(): string;
	displayName(): string;
	displayTooltip(): string;
	isVerified(): boolean;
	isOfficial(): boolean;
	isConfigured(): boolean;
	isDeprecated(): boolean;
	isLibraryStep(): boolean;
	iconURL(): string;
	summary(): string;
}
