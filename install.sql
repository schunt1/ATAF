SET DEFINE OFF
SET VERIFY OFF
SET SERVEROUTPUT ON SIZE UNLIMITED
SET TIMING ON

spool install.log

PROMPT 'Running Build File'
@buildScript.sql

declare
    l_workspace_id number;
begin
    select workspace_id into l_workspace_id
      from apex_workspaces
     where workspace = 'ATAF';
    --
    apex_application_install.set_workspace_id( l_workspace_id );
    apex_application_install.set_application_id(108);
    apex_application_install.generate_offset;
    apex_application_install.set_schema( 'ATAF' );
    apex_application_install.set_application_alias( 'F' || apex_application.get_application_id );
end;
/

PROMPT 'Installing Application'
@F100710.SQL
