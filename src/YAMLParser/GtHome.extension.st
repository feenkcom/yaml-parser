Extension { #name : #GtHome }

{ #category : #'*YAMLParser' }
GtHome >> yamlSection [
	<gtHomeSection>
	^ GtHomeYAMLSection new
		priority: 8
]
