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
	spec for: #'common' do: [
	
		"spec baseline: 'ExternalProject' with: [
			spec repository: 'github://<organization>/<repository>:main/src' ]."
			
		spec package: 'YAMLParser'.
		"spec package: 'PackageTwo' with: [ 
			spec requires: #( 'ExternalProject' 'YAMLParser' ) ]"
	]
]
