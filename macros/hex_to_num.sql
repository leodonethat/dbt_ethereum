{% macro hex_to_num() %}

-- https://stackoverflow.com/questions/39498558/convert-long-postgres-bytea-to-decimal
-- pre: s0x is a string that starts with '0x'
create or replace function hex_to_num(s0x text) returns numeric as $$
declare
    len integer;
    result  bigint;
    s text;
begin
    select right(s0x, -2) into s;
    select length(s) into len;
    if len <= 15 then
        execute 'select x''' || s || '''::bigint' into result;
        return result::numeric;
    else
        return hex_to_num('0x' || left(s, (len+1)/2)) * (16::numeric)^(len/2) +
               hex_to_num('0x' || right(s, len/2));
        return 0;
    end if;
end;
$$ language plpgsql immutable strict;

{% endmacro %}
