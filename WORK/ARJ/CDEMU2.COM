��     CDEMU2: Error - an unsupported MSCDEX function was called.
Register values were:
AX =    BX =    CX =    SI =    DI =    ES =  
Press any key to continue:
 CDEMU2= tD��u<��r�J���U2���.���]� �5�.�.n
����




��}U��~��u���F��]��VP� ��6�XP��6a�����6i�s���|�6q�g^XPV�n�6y�Y���b�6��M���V�6��A� �X^�.�2�.��2��VWQ�6���.�2������Y_^�R�� Zs3����û
�RQS� r.�� t/,�'��P�� r#Z�� rZR�& �� r�� r�[YZø ���� ���  QSR�r r^�� t_� rZ�u � rR��� � rDZR.;�wA����w �g r.XZRP� �a r �a r[S� .;�u�� �Z[Yø ���� ��� ����.�&.:tr����u���.�W����=�!r���3ɸ B�!ô?�!ô>�!�P�< t����X�P��� X��Q����� ��� Y�$0<:|���                               ���	�!�� �<u�Q�p</t<-u�N� 3��/�� t���Q�>����O<t[<A|B<a|, <Zw8,A��<:u�< t<uN3����<=u�ë�< t
<t�C��N� C��P���	�!Z��!��� ���>~.3ۍ6��2�I��d:�|�$�D�D�D�DC�����uҍ#�	�!�6��2�� ��!�A���!�:�!����9�	�!�/5�!�����/%�!�ױ��B� 1�!�<Ut<ut�<�N��/5�!��� +��6��t�e�3�&��/%�!&�6, �I�!r�I�!s�������	�!� L�!�	�!�L�!�< t�<	t��CDEMU2 Rev. A - an MSCDEX emulator for networked CD-ROM drives.
Written in assembler by J.M.A. Hall, U.K., May 1995.
Based on the C program MXSUB by Digital Solutions, Australia.
$Usage: CDEMU2 letter[:][=filespec] [letter...] to install
       CDEMU2 /U to uninstall
$ERROR: cannot install - CDEMU2 or MSCDEX is already installed
$ERROR: the character "$" is not a valid drive letter
$Installed for drives $
$ERROR: invalid option letter (not "U")
$ERROR: cannot unload - INT 2F does not point to CDEMU2
$ERROR: cannot free memory belonging to CDEMU2
$CDEMU2 successfully unloaded.
$