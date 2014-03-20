iOS_Singleton_Protocol
======================

We usually use singletonManager to handle tasks like: Networking request, read write IO, .... It produces the dependency. Following ["Design Principles from Design Patterns"](http://www.artima.com/lejava/articles/designprinciplesP.html) - GoF, we should do "Program to an interface, not an implementation". So, I think we should use Protocol over Singleton in this context. It is the sample project to show how to replace singleton with Protocol in iOS.
