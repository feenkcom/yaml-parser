Extension { #name : #GtHome }

{ #category : #'*YAMLParser' }
GtHome >> yamlSection [
	<gtHomeSection>
	^ GtHomeStartPageSection new
		sectionTitle: 'Get started with the YAML Parser project';
		title: 'YAML Parser';
		description: 'The YAML Parser project';
		databaseName: 'YAML Parser Notebook';
		startPageName: 'YAML Parser Overview';
		priority: 8
]
