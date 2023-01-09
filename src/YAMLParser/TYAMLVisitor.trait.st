Trait {
	#name : #TYAMLVisitor,
	#traits : 'TSmaCCParseNodeVisitor',
	#classTraits : 'TSmaCCParseNodeVisitor classTrait',
	#category : #'YAMLParser-SmaCC'
}

{ #category : #generated }
TYAMLVisitor >> visitYAML: aYAML [
	^ self visitSmaCCParseNode: aYAML
]
