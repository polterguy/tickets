# Aista's support and ticket system

This is [Aista](https://aista.com)'s ticket system, implying the system we're currently
actually using ourselves to give customer support and help developers with Magic and Hyperlambda.
Since we're nice guys and gals though, we've chosen to open source license the thing,
providing it as a plugin to your own Magic and Hyperlambda backend, allowing you to install it
in 5 seconds, through the plugins component in Magic.

## Entities

The primary database entities of the system is as follows.

* __status__ - Status of ticket
* __priorities__ - Priority of ticket
* __departments__ - Department the ticket should be handled by
* __tickets__ - Actual support request
* __messages__ - Messages associated with a ticket

The primary entity above is _"tickets"_, which is a single support request, and its status
is _not_ overridable by the user itself, but only possible to change by an administrator
in the system. Creating a ticket requires the user to be authenticated as _"guest"_.

## Administration interface

The system also features an _"admin only"_ part, which are HTTP endpoints that can only
be invoked by root or admin users, which are intended for administrators to handle and answer
support requests. You can find these endpoints in the _"admin"_ folder. However, admin users
can in general invoke all endpoints for non-admin users, with the difference that an admin
user is allowed to count, view and edit tickets and messages not belonging to himself. While
a non-admin user can only see and edit tickets that belongs to himself.

## Database support

The system _only_ supports MySQL and SQLite currently, so if you don't have one of these databases
as your currently default database, you'll either have to port it, change its code somehow, or avoid
installing it in the first place. We might port the system to PostgreSQL later, but this is not
something we're considering at the moment.
