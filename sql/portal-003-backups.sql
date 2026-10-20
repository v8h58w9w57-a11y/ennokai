-- 宴の会・親睦会ポータル: バックアップ（復元ポイント）の保存先
create table if not exists public.ennokai_backups (
  id         uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  reason     text,
  summary    text,
  data       jsonb not null
);
create index if not exists ennokai_backups_created on public.ennokai_backups (created_at desc);
alter table public.ennokai_backups enable row level security;
drop policy if exists ennokai_backups_all on public.ennokai_backups;
create policy ennokai_backups_all on public.ennokai_backups for all to anon, authenticated using (true) with check (true);
grant select, insert, update, delete on public.ennokai_backups to anon, authenticated;
