#!/bin/bash

# shellcheck disable=SC2120
do_create()
{
  echo "starting notebook"
	if [ ! -e $2 ]; then
  echo "{"cells": [],
         "metadata": {},
         "nbformat": 4,
         "nbformat_minor": 2}" >> $2
fi
}

# shellcheck disable=SC2120
do_delete()
{
  echo "deleting notebook"
  rm $2
}

# shellcheck disable=SC2120
do_read()
{
  echo "reading notebook"
  rm $2
}

# shellcheck disable=SC2120
do_edit()
{
  echo "editing notebook"
  vi $2
}


echo "Press <CTRL+C> to exit."
case "$1" in
  'create_notebook')
        do_create
        ;;
  'delete_notebook')
        do_delete
        ;;
  'read_notebook')
        do_read
        ;;
  'edit_notebook')
        # shellcheck disable=SC2119
        do_edit
        ;;
  *)
  echo
  echo "Usage: $0 { create_notebook | delete_notebook | read_notebook | edit_notebook }"
  ;;
esac