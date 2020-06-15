# terraform-aws-iam

- ``` terraform-aws-policies_collect-wsc  ``` is a Terraform module to generate json document.
- it's an opensource module under GPL license

## Usage

```
module "sg-wsc" {
  source  = "mehdi-wsc/iam-ws/aws"
  version = "0.0.1


}


```

## Input Variables:

| name                      | description                                                                                       | type         | required |
|---------------------------|---------------------------------------------------------------------------------------------------|--------------|----------|
| policies_documents        | Lis of policies must be on JSON format                                                            | list(string  | yes      |


## Output Variables:

| name                     | description           |
|--------------------------|-----------------------|
| Policies_result_document | Aggregeted IAM policy |



## License:
```
                    GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

                            Preamble

  The GNU General Public License is a free, copyleft license for
software and other kinds of works.

  The licenses for most software and other practical works are designed
to take away your freedom to share and change the works.  By contrast,
the GNU General Public License is intended to guarantee your freedom to
share and change all versions of a program--to make sure it remains free
software for all its users.  We, the Free Software Foundation, use the
GNU General Public License for most of our software; it applies also to
any other work released this way by its authors.  You can apply it to
your programs, too.
```