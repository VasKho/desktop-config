{ pkgs, lib, ... }: {
  imports = [ ./default.nix ];

  programs.zed-editor = {
    userKeymaps = [
      {
        bindings = {
          "alt-0" = "project_panel::Toggle";
          "ctrl-x m" = "outline_panel::Toggle";
          "ctrl-x g" = "git_panel::Toggle";
          "ctrl-x ctrl-c" = "zed::Quit";
          "ctrl-x t" = "tab_switcher::Toggle";
          "alt-t" = "terminal_panel::Toggle";
        };
      }
      {
        context = "Editor";
        bindings = {
          "alt-w" = "editor::Copy";
          "ctrl-w" = "editor::Cut";
          "ctrl-y" = "editor::Paste";
          "alt-d" = "editor::Delete";
          "ctrl-alt-d" = "editor::DeleteToNextSubwordEnd";
          "ctrl-p" = "editor::MoveUp";
          "ctrl-n" = "editor::MoveDown";
          "ctrl-b" = "editor::MoveLeft";
          "ctrl-f" = "editor::MoveRight";
          "ctrl-alt-p" = "editor::MoveToStartOfParagraph";
          "ctrl-alt-n" = "editor::MoveToEndOfParagraph";
          "ctrl-alt-f" = "editor::MoveToNextSubwordEnd";
          "ctrl-alt-b" = "editor::MoveToPreviousSubwordStart";
          "ctrl-space" = "editor::SetMark";
          "ctrl-/" = "editor::Undo";
          "ctrl-alt-/" = "editor::Redo";
          "ctrl-e" = "editor::MoveToEndOfLine";
          "ctrl-a" = [
            "editor::MoveToBeginningOfLine"
            {
              stop_at_soft_wraps = false;
              stop_at_indent = false;
            }
          ];
          "alt-backspace" = "editor::DeleteToPreviousSubwordStart";
          "alt-m" = [
            "editor::MoveToBeginningOfLine"
            {
              stop_at_soft_wraps = false;
              stop_at_indent = true;
            }
          ];
          "alt-;" = [
            "editor::ToggleComments"
            { advance_downwards = true; }
          ];
          "ctrl-x h" = "editor::SelectAll";
        };
      }
      {
        context = "Editor && selection_mode";
        bindings = {
          "ctrl-p" = "editor::SelectUp";
          "ctrl-n" = "editor::SelectDown";
          "ctrl-b" = "editor::SelectLeft";
          "ctrl-f" = "editor::SelectRight";
          "ctrl-alt-p" = "editor::SelectToStartOfParagraph";
          "ctrl-alt-n" = "editor::SelectToEndOfParagraph";
          "ctrl-alt-f" = "editor::SelectToNextSubwordEnd";
          "ctrl-alt-b" = "editor::SelectToPreviousSubwordStart";
          "ctrl-e" = "editor::SelectToEndOfLine";
          "ctrl-a" = [
            "editor::SelectToBeginningOfLine"
            {
              stop_at_soft_wraps = false;
              stop_at_indent = false;
            }
          ];
          "alt-m" = [
            "editor::SelectToBeginningOfLine"
            {
              stop_at_soft_wraps = false;
              stop_at_indent = true;
            }
          ];
        };
      }
      {
        context = "Editor && mode == full";
        bindings = {
          "ctrl-g ctrl-g" = "go_to_line::Toggle";
          "ctrl-s" = "buffer_search::Deploy";
        };
      }
      {
        context = "Editor && showing_completions";
        bindings = {
          "tab" = "editor::ContextMenuNext";
          "shift-tab" = "editor::ContextMenuPrevious";
          "ctrl-n" = "editor::ContextMenuNext";
          "ctrl-p" = "editor::ContextMenuPrevious";
          "enter" = "editor::ConfirmCompletion";
        };
      }
      {
        context = "ProjectPanel";
        unbind = {
          "enter" = "project_panel::Rename";
        };
        bindings = {
          "enter" = [
            "workspace::SendKeystrokes"
            "space alt-0"
          ];
        };
      }
      {
        context = "ProjectPanel && not_editing";
        bindings = {
          "tab" = "project_panel::Open";
          "shift-c" = "project_panel::Copy";
          "shift-p" = "project_panel::Paste";
          "shift-x" = "project_panel::Cut";
          "shift-d" = [
            "project_panel::Trash"
            {
              skip_prompt = true;
            }
          ];
          "shift-r" = "project_panel::Rename";
          "c f" = "project_panel::NewFile";
          "c d" = "project_panel::NewDirectory";
        };
      }
      {
        context = "GitPanel && !Editor";
        bindings = {
          "q" = "git_panel::Close";
        };
      }
      {
        context = "Workspace";
        bindings = {
          "alt-x" = "command_palette::Toggle";
          "ctrl-x ctrl-s" = "workspace::Save";
          "ctrl-x b" = "file_finder::Toggle";
          "ctrl-x o" = "workspace::ActivateNextPane";
          "ctrl-x 4 0" = "pane::JoinIntoNext";
        };
      }
      {
        context = "Pane";
        bindings = {
          "ctrl-x k" = [
            "pane::CloseActiveItem"
            {
              close_pinned = false;
            }
          ];
          "ctrl-x 1" = [
            "pane::CloseOtherItems"
            {
              close_pinned = false;
            }
          ];
          "ctrl-x 3" = "pane::SplitVertical";
          "ctrl-x 2" = "pane::SplitHorizontal";
        };
      }
    ];
  };
}
