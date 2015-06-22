
Continuous Data Migration
=========================

This package demonstrates an example of application using continuous data migration.
*Data migration* consists in updating the format of existing data, produced by an old version of a software, to the new version.
This is usually done by keeping the old data formats from every released version of the software, together with conversion functions able to convert the data into the new format.

*Continuous data migration* consists, while updating a data structure in a software, in specifying the conversion needed relative to the previous version, without storing all the old versions.

In this repository, we demonstrate this process using the libraries `previous-version` and `safecopy`.
 


