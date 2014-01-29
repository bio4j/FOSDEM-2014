% Bio4j + Statika
% [Alexey Alekhin](http://ohnosequences.com/aalekhin)
% GraphDevRoom 2014

# Bio4j + Statika: Managing module dependencies on the type level

<!--
Abstract from the FOSDEM site:

Bio4j bioinformatics graph database is modular and customizable, allowing you to import just the data you are interested in. There exist, though, dependencies among these resources that must be taken into account and that's where Statika enters the picture; a set of Scala libraries which allows you to declare dependencies between components of any modular system and track their correctness using Scala type system. Thanks to this, it's possible now to deploy only selected components of the integrated data sets, with Amazon Web Services deployments on hardware specifically configured for them.
-->

----

### Bio4j modules

- diagram of dependencies
- a lot of data in modules =>
- importance of possibility to import only what you need
- different releases/distributions
- (?) importance of doing it in the cloud

----

### What is Statika

- scala type system
- generic modular system
- layers: code + sbt + AWS
- accent on static thing

----

### Bio4j + Statika

- declaring layout of existing modules using statika bundles (pic of the hierarchy)
- respecting dependencies on different levels (raw data inter-deps, modules depend on raw data + their own interdeps)
- (?) possibility to make incremental import of modules to existing releases
- ease and robustness of releasing (incl. tests) and deployment (thnx to aws-statika part + statika-cli for applying bundles)
