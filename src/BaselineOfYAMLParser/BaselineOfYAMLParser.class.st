Class {
	#name : #BaselineOfYAMLParser,
	#superclass : #BaselineOf,
	#category : #BaselineOfYAMLParser
}

{ #category : #accessing }
BaselineOfYAMLParser class >> loadLepiter [
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase properties.
	currentProperties
		addRegisteredDirectory: FileLocator imageDirectory / 'pharo-local' / 'iceberg' / 'feenkcom'
				/ 'yaml-parser' / 'lepiter'.
	LeDatabasesRegistry default defaultLogicalDatabase reload
]

{ #category : #baseline }
BaselineOfYAMLParser >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'GToolkit4SmaCC'
				with: [ spec repository: 'github://feenkcom/gt4smacc:main/src' ].
			spec
				baseline: 'GToolkitPhlow'
					with: [ spec repository: 'github://feenkcom/gtoolkit-phlow:main/src' ];
				baseline: 'GToolkit4PetitParser2'
					with: [ spec repository: 'github://feenkcom/gt4petitparser2:main/src' ].
			spec
				package: 'YAMLParser'
				with: [ spec requires: #('GToolkitPhlow' 'GToolkit4PetitParser2' 'GToolkit4SmaCC') ] ]
]
