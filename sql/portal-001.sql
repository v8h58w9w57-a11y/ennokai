-- 親睦会ポータル用の追加（何度実行しても安全）
-- 1) 名簿に男女の欄を追加（'男' / '女' / 未設定 = null）
alter table public.ennokai_roster add column if not exists gender text;

-- 2) 行事ごとのチーム分けの保存先
create table if not exists public.ennokai_teams (
  event_id   uuid primary key references public.ennokai_events(id) on delete cascade,
  team_count int not null default 0,
  data       jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
-- 既存の ennokai のテーブルと同じ扱い（公開キーで読み書きできる）
alter table public.ennokai_teams disable row level security;
grant select, insert, update, delete on public.ennokai_teams to anon, authenticated;
