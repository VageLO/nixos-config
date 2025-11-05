{ config, ... }:
{
  programs.nixvim.plugins.obsidian = {
    enable = true;

    settings = {
      legacy_commands = false;
      frontmatter.enable = false;
      notes_subdir = "2 Inbox";
      new_notes_location = "notes_subdir";

      workspaces = [
        {
          name = "main-vault";
          path = "${config.home.homeDirectory}/main-vault";
        }
      ];

      daily_notes = {
        folder = "Notes/DailyNotes";
        date_format = "%Y-%-m-%d";
        template = "Note templates/Nvim Daily Notes.md";
      };

      templates = {
        folder = "templates";
      };

      picker = {
        name = "telescope.nvim";
        note_mappings = {
          new = "<C-x>";
          insert_link = "<C-l>";
        };
        tag_mappings = {
          tag_note = "<C-x>";
          insert_tag = "<C-l>";
        };
      };

      completion = {
        blink = true;
      };
    };
  };

  programs.nixvim = {
    keymaps = [
      { key = "<leader>p"; mode = [ "n" ]; action = "<cmd>! $VAULT/pomodoro<cr>"; }
      { key = "<leader>dn"; mode = [ "n" ]; action = "<cmd>ObsidianCustomToday<cr>"; }
      { key = "<leader>nd"; mode = [ "n" ]; action = "<cmd>ObsidianCustomTomorrow<cr>"; }
      { key = "<leader>pd"; mode = [ "n" ]; action = "<cmd>ObsidianCustomYesterday<cr>"; }
      { key = "<leader>wn"; mode = [ "n" ]; action = "<cmd>ObsidianWeek<cr>"; }
      { key = "<leader>mn"; mode = [ "n" ]; action = "<cmd>ObsidianMonth<cr>"; }
      { key = "<leader>yn"; mode = [ "n" ]; action = "<cmd>ObsidianYear<cr>"; }
    ];
    userCommands = {
      ObsidianCustomToday = {
        command = ''
        lua
        local weekly_notes = require("weekly_notes")
        local opts = Obsidian.opts
        opts.daily_notes.workdays_only = false

        local year = os.date("%Y") -- e.g., "2025"
        local month = os.date("%m"):gsub("^0", "") -- e.g., "4"
        local week_number = tonumber(os.date("%V")) or 1
        local week = "Week " .. tostring(week_number)

        local week_days = weekly_notes.get_week_days(week_number, tonumber(year))

        local base_path = "/Notes/DailyNotes"
        local target_dir = string.format("%s/%s/%s", base_path, year, month)

        opts.daily_notes.folder = target_dir
        opts.templates.substitutions = {
          year = year,
          month = month,
          week_month = week_days.month,
          week = week,
          weekTitle = week
        }

        local note = require("obsidian.daily").today()
        note:open()
        '';
        desc = "Create or open a daily note with custom year/month path";
      };
      ObsidianCustomTomorrow = {
        command = ''
        lua
        local weekly_notes = require("weekly_notes")
        local opts = Obsidian.opts
        opts.daily_notes.workdays_only = false

        local tomorrow_time = os.time() + (24 * 60 * 60)

        local year = os.date("%Y", tomorrow_time) -- e.g., "2025"
        local month = os.date("%m", tomorrow_time):gsub("^0", "") -- e.g., "4"
        local week_number = tonumber(os.date("%V", tomorrow_time)) or 1
        local week = "Week " .. tostring(week_number)

        local week_days = weekly_notes.get_week_days(week_number, tonumber(year))

        local base_path = "/Notes/DailyNotes"
        local target_dir = string.format("%s/%s/%s", base_path, year, month)

        opts.daily_notes.folder = target_dir
        opts.templates.substitutions = {
          year = year,
          month = month,
          week_month = week_days.month,
          week = week,
          weekTitle = week
        }

        local note = require("obsidian.daily").daily(1)
        note:open()
        '';
        desc = "Create or open a daily note for the next day with custom year/month path";
      };
      ObsidianCustomYesterday = {
        command = ''
        lua
        local weekly_notes = require("weekly_notes")
        local opts = Obsidian.opts
        opts.daily_notes.workdays_only = false

        local yesterday_time = os.time() - (24 * 60 * 60)

        local year = os.date("%Y", yesterday_time) -- e.g., "2025"
        local month = os.date("%m", yesterday_time):gsub("^0", "") -- e.g., "4"
        local week_number = tonumber(os.date("%V", yesterday_time)) or 1
        local week = "Week " .. tostring(week_number)

        local week_days = weekly_notes.get_week_days(week_number, tonumber(year))

        local base_path = "/Notes/DailyNotes"
        local target_dir = string.format("%s/%s/%s", base_path, year, month)

        opts.daily_notes.folder = target_dir
        opts.templates.substitutions = {
          year = year,
          month = month,
          week_month = week_days.month,
          week = week,
          weekTitle = week
        }

        local note = require("obsidian.daily").yesterday()
        note:open()
        '';
        desc = "Create or open a daily note from the last day with custom year/month path";
      };
      ObsidianWeek = {
        command = ''
        lua
        local weekly_notes = require("weekly_notes")
        local client = require("obsidian.client")
        local opts = Obsidian.opts

        local year = os.date("%Y")
        local week_number = tonumber(os.date("%V")) or 1

        local week_days = weekly_notes.get_week_days(week_number, tonumber(year))

        local month = week_days.month

        local prev_week = week_number - 1
        if prev_week == 0 then
            prev_week = 52
        end

        local prev_week_days = weekly_notes.get_week_days(prev_week, tonumber(year))
        local prev_month = prev_week_days.month

        -- Set up template substitutions
        local substitutions = {
          year = year,
          yearTitle = year,
          month = month,
          monthTitle = week_days.month_title,
          prev_month = prev_month,
          prev = tostring(prev_week),
          prevTitle = tostring(prev_week),
          monday = week_days.monday,
          tuesday = week_days.tuesday,
          wednesday = week_days.wednesday,
          thursday = week_days.thursday,
          friday = week_days.friday,
          saturday = week_days.saturday,
          sunday = week_days.sunday,
        }

        opts.templates.substitutions = substitutions

        -- Configure weekly note path
        local base_path = "Notes/WeeklyNotes"
        local target_dir = string.format("%s/%s/%s", base_path, year, month)

        local note_name = string.format("Week %d.md", week_number)
        local note_path = string.format("%s/%s", target_dir, note_name)

        local note = client:resolve_note(note_path)

        if not note then
          local week_template = "Note templates/Nvim Weekly Notes.md"

          -- Create new note
          note = client:create_note({
            title = note_name,
            dir = target_dir,
            template = week_template,
          })
        end

        client:open_note(note)
        '';
        desc = "Create or open a weekly note with template and wiki-linked dates";
      };
      ObsidianMonth = {
        command = ''
        lua
        local client = require("obsidian.client")
        local opts = Obsidian.opts

        local year = os.date("%Y")
        local month = os.date("%m"):gsub("^0", "")

        opts.templates.substitutions = {
          year = year,
          yearTitle = year
        }

        -- Configure montly note path
        local base_path = "Notes/MonthlyNotes"
        local target_dir = string.format("%s/%s", base_path, year)

        local note_name = string.format("%d.md", month)
        local note_path = string.format("%s/%s", target_dir, note_name)

        local note = client:resolve_note(note_path)

        if not note then
          local month_template = "Note templates/Nvim Monthly Notes.md"

          -- Create new note
          note = client:create_note({
            title = note_name,
            dir = target_dir,
            template = month_template,
          })
        end

        client:open_note(note)
        '';
        desc = "Create or open a monthly note";
      };
      ObsidianYear = {
        command = ''
        lua
        local client = require("obsidian.client")
        local opts = Obsidian.opts

        local year = tonumber(os.date("%Y"))
        local prev = tostring(year - 1)

        opts.templates.substitutions = {
          prev = prev,
          prevTitle = prev
        }

        -- Configure yearly note path
        local base_path = "Notes/YearlyNotes"

        local note_name = string.format("%d.md", year)
        local note_path = string.format("%s/%s", base_path, note_name)

        local note = client:resolve_note(note_path)

        if not note then
          local year_template = "Note templates/Yearly Note.md"

          -- Create new note
          note = client:create_note({
            title = note_name,
            dir = base_path,
            template = year_template,
          })
        end

        client:open_note(note)
        '';
        desc = "Create or open a yearly note";
      };
    };
    extraFiles = {
      "lua/weekly_notes.lua" = {
        text = ''
        local M = {}

        -- Function to compute dates for Monday through Sunday as YYYY-M-DD and return month
        function M.get_week_days(week_number, year)
            if not (year and week_number) or type(year) ~= "number" or type(week_number) ~= "number" then
                error("Invalid input: year and week_number must be numbers")
            end

            year = math.floor(year)
            week_number = math.floor(week_number)

            local function has_53_weeks(yr)
                local jan1 = os.time({ year = yr, month = 1, day = 1, hour = 0 })
                local jan1_weekday = tonumber(os.date("%w", jan1))
                local is_leap = (yr % 4 == 0 and yr % 100 ~= 0) or (yr % 400 == 0)
                return (jan1_weekday == 4) or (jan1_weekday == 3 and is_leap)
            end

            local max_weeks = has_53_weeks(year) and 53 or 52
            if week_number < 1 or week_number > max_weeks then
                error(string.format("Invalid week_number: %d. Must be between 1 and %d for year %d", week_number, max_weeks, year))
            end

            local jan4 = os.time({ year = year, month = 1, day = 4, hour = 0 })
            local jan4_weekday = tonumber(os.date("%w", jan4)) -- 0=Sunday, 1=Monday, ..., 6=Saturday

            local days_to_week1_monday = (jan4_weekday == 0 and 6 or jan4_weekday - 1)
            local week1_monday = jan4 - (days_to_week1_monday * 24 * 60 * 60)

            local days_to_target_monday = (week_number - 1) * 7 * 24 * 60 * 60
            local monday_time = week1_monday + days_to_target_monday

            local days = {}
            for i = 0, 6 do
                days[i + 1] = os.date("%Y-%-m-%d", monday_time + (i * 24 * 60 * 60))
            end

            local month = os.date("%m", monday_time):gsub("^0", "")
            local month_title = os.date("%b", monday_time)

            return {
                monday = days[1],
                tuesday = days[2],
                wednesday = days[3],
                thursday = days[4],
                friday = days[5],
                saturday = days[6],
                sunday = days[7],
                month = month,
                month_title = month_title
            }
        end

        return M
      '';
      };
    };
  };
}
