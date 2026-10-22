-- 名簿に役職（社長・工場長・課長・係長・班長）を追加
alter table public.ennokai_roster add column if not exists position text;
