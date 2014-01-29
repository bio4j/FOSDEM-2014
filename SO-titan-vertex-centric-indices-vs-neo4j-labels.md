Agreeing with everything Marko said, one could take it further and argue that in the graph database world local indexes can (and even should) substitute global ones. In my opinion, the single greatest advantage of a graph data model is that it lets you encode your data model into the graph topology, gaining qualitative advantages in terms of flexibility, ease of evolution and performance. With this in mind, I'd argue that labels in Neo4j actually detract from all this; reifying a label into a node with adjacent edges pointing to the source having that label is much more in line with the "schema is the graph" philosophy.

Of course, _if_ your engine lacks local indexes we are back at the supernode problem. But if you have them (something which I'd say should be a requirement for something to be called a graph database), you can easily transform your label into a node `L`, and create relationships pointing to that node for those vertices which you want labeled with `L`

```
v -[L]-> L
```

meaning that `v` has label `L`. Now if you want this in Titan to behave like a Neo4j label, just make the `-[L]->` relation to be "manyToOne" (see [Titan cardinality constraints](https://github.com/thinkaurelius/titan/wiki/Type-Definition-Overview#cardinality-constraints)) and create a vertex-centric index. This pattern lets you get everything that you could with labels and much more; you can 

- add a _label-specific_ id to the `-[L]->` edge
- effectively use this as a namespace for properties relating to that label
- sort your elements inside one label
- nest labels easily without losing performance (just use a composite key)
- separate the declaration of a label `L` with how elements labeled with it are accessed
