Best Practices
++++++++++++++

The following is a list of best practices for authoring CloudSlang
files. Many of these best practices are checked when using the
:doc:`CloudSlang Build Tool <cloudslang_build_tool>`.

.. _cloudslang_content_best_practices:

CloudSlang Content Best Practices
=================================

-  The namespace for a file matches the suffix of the file path in which
   the file resides, for example, the send\_mail operation is found in the
   **cloudslang-content/io/cloudslang/base** folder, so it uses the
   namespace ``io.cloudslang.base.mail``.
-  Namespaces should be comprised of only lowercase alphanumeric
   characters (a-z and 0-9), underscores (_), periods(.) and hyphens
   (-).
-  A flow or operation has the same name as the file it is in.
-  Each file has one flow or one operation.
-  Flows and operations reside together in the same folders.
-  System properties files do not reside in the same folder together with flows
   and operations.
-  Identifiers (flow names, operation names, input names, etc.) are
   written:

     -  In snake_case, lowercase letters with underscores (_) between
        words, in all cases other than inputs to a Java @Action.
     -  In camelCase, starting with a lowercase letter and each additional
        word starting with an uppercase letter appended without a
        delimiter, for inputs to a Java @Action.
     -  Results are written in ALL_CAPS.

-  Assign only relevant default values. For example, 8080 is a good candidate
   for a port number, but john_doe is probably not a good candidate for a user
   name.
-  Flow and operation files begin with a commented description and list
   of annotated inputs, outputs and results (see `CloudSlang Comments
   Style Guide <#cloudslang-comments-style-guide>`__).

     -  Optional parameters, default and valid values are noted.
     -  Examples are provided when useful.

CloudSlang Tests Best Practices
===============================

-  Tests are contained in a directory with a folder structure identical
   to the structure of the directory they are testing.
-  Tests for a particular CloudSlang file are written in a file with the
   same name, but with the **.inputs.yaml** extension, for example, the flow
   **print_text.sl** is tested by tests in
   **print_text.inputs.yaml**.
-  Wrapper flows reside in the same folder as the tests call them.

.. note::
   In future releases some of the above best practices may be required by the CloudSlang compiler.

CloudSlang Inputs Files Best Practices
======================================

-  The name of an inputs file ends with **.inputs.yaml**.

CloudSlang Comments Style Guide
===============================

All CloundSlang flows and operations should begin with a documentation
block that describes the flow or operation, and lists the inputs,
outputs and results.

A flow or operation's documentation may be viewed from the CLI using the
:ref:`inspect <inspect_a_flow_or_operation>` command.

-  Documentation blocks begin with a line containing ``#!!`` and nothing else.
-  Documentation blocks end with a line containing ``#!!#`` and nothing else.
-  Each line of the documentation begins with ``#!``.
-  Lines in the documentation block that do not begin with ``#!`` will not be
   considered as part of the documentation and will not display when the file is
   inspected.
-  The ``@description`` tag is the only mandatory tag.
-  The other possible tags are:

     - ``@prerequisites``
     - ``@input <input_name>``
     - ``@output <output_name>``
     - ``@result <result_name>``

::

    ####################################################
    #!!
    #! @description: Does something fantastic.
    #!
    #! @prerequisites: Some Python module.
    #!
    #! @input input_1: first input
    #! @input input_2: second input
    #!                 default: true
    #!                 valid: true, false
    #! @input input_3: third input
    #!                 optional
    #!                 example: 'someone@mailprovider.com'
    #! @input input_4: fourth input
    #!                 format: space delimited list of strings
    #! @output output_1: first output
    #! @result SUCCESS: good
    #! @result FAILURE: bad
    #!!#
    ####################################################

Description
-----------

-  Written as a sentence, beginning with a capital letter and ending
   with a period.
-  Written in the present tense, for example, "Prints text.".
-  Does not include "This flow" or "This operation" or anything similar.

Prerequisites
-------------

-  Flows and operations that assume prerequisites should declare them.

Inputs, Outputs and Results
---------------------------

-  Fields appear in the same order as they appear in the code.
-  Description begins with a lowercase letter (unless a proper name or
   capitalized acronym) and does not end with a period.
-  Usage of the words "the" and "a" are strongly discouraged, especially
   at the beginning of the description.
-  Description does not include "this flow", "this operation", "this field" or
   anything similar.
-  Proper names and acronyms that are normally capitalized are
   capitalized, for example, HTTP, Docker, ID.

Inputs and Outputs
------------------

-  Written in the present tense, for example, "true if job exists".
-  Non-required fields contain the "optional" label.
-  Additional labels are "default:", "example:", "valid:" and "format:".

Results
-------

-  Actions written in the past tense, for example, "error occurred". States
   written in the present tense, for example, "application is up".
-  Default results which do not require any additional explanation are omitted.

Recurring Fields
----------------

-  Fields that appear often with the same meaning should have the same
   name and description across flows and operations. However, if the
   meaning is specific to the flow or operation, the field description
   may be different. Some examples are:

     -  FAILURE - otherwise
     -  error_message - error message if error occurred
     -  command - command to execute
