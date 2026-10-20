-- チーム分けを保存できるようにする（ほかの ennokai のテーブルと同じく、公開キーで読み書きを許可）
alter table public.ennokai_teams enable row level security;
drop policy if exists ennokai_teams_all on public.ennokai_teams;
create policy ennokai_teams_all on public.ennokai_teams for all to anon, authenticated using (true) with check (true);
grant select, insert, update, delete on public.ennokai_teams to anon, authenticated;
