require File.expand_path("config/environment.rb")

class SoloWizardTasks < Thor

  desc "create_first_soloist_script", "Create the first soloist script"
  def create_first_soloist_script
    soloist_script = SoloistScript.create
    soloist_script.recipe_ids = Recipe.all.map(&:id)
    soloist_script.save!
  end

  desc "clean_all_tables", "Empty out all of the tables"
  def clean_all_tables
    SoloistScript.destroy_all
    Recipe.destroy_all
    RecipeGroup.destroy_all
  end

  desc "create_pivotal_workstation_recipes", "Create the initial set of recipes from pivotal workstation"
  def create_pivotal_workstation_recipes
    group01 = RecipeGroup.create :name => "Development Stack", :position => 1
    group02 = RecipeGroup.create :name => "Databases", :position => 2
    group03 = RecipeGroup.create :name => "General Software", :position => 6
    group04 = RecipeGroup.create :name => "OS-X Settings", :position => 7, :description => "Configuring your OS-X with some helpful settings"
    group05 = RecipeGroup.create :name => ".bash_profile", :position => 8
    group06 = RecipeGroup.create :name => "Command Line Tools", :position => 3
    group07 = RecipeGroup.create :name => "Source Control", :position => 4
    group08 = RecipeGroup.create :name => "Text Editors", :position => 5
    group09 = RecipeGroup.create :name => "Etc", :position => 9
    group10 = RecipeGroup.create :name => "Pivotal Workstation Meta", :position => 10, :description => "Each 'Meta' recipe is a collection of other recipes"

    group06.recipes.create :name => "ack"
    group04.recipes.create :name => "active_corners"
    group01.recipes.create :name => "activemq"
    group09.recipes.create :name => "add_ops_user"
    group06.recipes.create :name => "ag"
    group03.recipes.create :name => "alfred"
    group05.recipes.create :name => "bash_path_order"
    group05.recipes.create :name => "bash_profile-aliases"
    group05.recipes.create :name => "bash_profile-arch_flags"
    group05.recipes.create :name => "bash_profile-better_history"
    group05.recipes.create :name => "bash_profile-ctrl-o"
    group05.recipes.create :name => "bash_profile-ctrl-s"
    group05.recipes.create :name => "bash_profile-git_completion"
    group05.recipes.create :name => "bash_profile-lang_en"
    group05.recipes.create :name => "bash_profile-no_sudo_gem_install"
    group05.recipes.create :name => "bash_profile-ps1"
    group05.recipes.create :name => "bash_profile-ree_settings"
    group09.recipes.create :name => "ca_certs_to_match_heroku"
    group03.recipes.create :name => "ccmenu"
    group03.recipes.create :name => "chrome"
    group09.recipes.create :name => "create_var_chef_cache"
    group09.recipes.create :name => "default_editor"
    group04.recipes.create :name => "defaults_fast_key_repeat_rate"
    group04.recipes.create :name => "disable_front_row"
    group04.recipes.create :name => "dock_preferences"
    group03.recipes.create :name => "dropbox"
    group06.recipes.create :name => "ec2_api_tools"
    group04.recipes.create :name => "enable_assistive_devices"
    group01.recipes.create :name => "erlang"
    group03.recipes.create :name => "evernote"
    group04.recipes.create :name => "finder_display_full_path"
    group03.recipes.create :name => "firefox"
    group03.recipes.create :name => "flycut"
    group03.recipes.create :name => "freeruler"
    group04.recipes.create :name => "function_keys"
    group09.recipes.create :name => "gem_no_rdoc_no_ri"
    group07.recipes.create :name => "git"
    group07.recipes.create :name => "git_config_global_defaults"
    group07.recipes.create :name => "git_projects"
    group07.recipes.create :name => "git_scripts"
    group07.recipes.create :name => "github_for_mac"
    group07.recipes.create :name => "github_ssh_keys"
    group07.recipes.create :name => "gitx"
    group09.recipes.create :name => "global_environment_variables"
    group09.recipes.create :name => "google_chrome_prevent_updates"
    group03.recipes.create :name => "grid"
    group06.recipes.create :name => "homebrew"
    group01.recipes.create :name => "imagemagick"
    group09.recipes.create :name => "increase_shared_memory"
    group04.recipes.create :name => "input_on_login"
    group09.recipes.create :name => "inputrc"
    group08.recipes.create :name => "intellij_community_edition"
    group08.recipes.create :name => "intellij_ultimate_edition"
    group06.recipes.create :name => "iterm2"
    group01.recipes.create :name => "java"
    group08.recipes.create :name => "joe"
    group06.recipes.create :name => "jumpcut"
    group04.recipes.create :name => "keyboard_preferences"
    group03.recipes.create :name => "keycastr"
    group03.recipes.create :name => "libreoffice"
    group09.recipes.create :name => "lion_basedev"
    group09.recipes.create :name => "locate_on"
    group01.recipes.create :name => "memcached"
    group04.recipes.create :name => "menubar_preferences"
    group03.recipes.create :name => "menumeters"
    group10.recipes.create :name => "meta_osx_base"
    group10.recipes.create :name => "meta_osx_development"
    group10.recipes.create :name => "meta_pivotal_lion_image"
    group10.recipes.create :name => "meta_pivotal_specifics"
    group10.recipes.create :name => "meta_ruby_development"
    group02.recipes.create :name => "mongodb"
    group03.recipes.create :name => "mouse_locator"
    group02.recipes.create :name => "mysql"
    group01.recipes.create :name => "nginx"
    group01.recipes.create :name => "node_js"
    group06.recipes.create :name => "oh_my_zsh"
    group09.recipes.create :name => "osx_updates"
    group03.recipes.create :name => "pg_admin"
    group09.recipes.create :name => "pivotal_logos"
    group02.recipes.create :name => "postgres"
    group03.recipes.create :name => "propane"
    group01.recipes.create :name => "qt"
    group01.recipes.create :name => "rabbitmq"
    group06.recipes.create :name => "rbenv"
    group01.recipes.create :name => "redis"
    group04.recipes.create :name => "remove_expose_keyboard_shortcuts"
    group04.recipes.create :name => "remove_garageband"
    group09.recipes.create :name => "rename_machine"
    group08.recipes.create :name => "rubymine"
    group08.recipes.create :name => "rubymine_preferences_pivotal"
    group06.recipes.create :name => "rvm"
    group04.recipes.create :name => "safari_preferences"
    group03.recipes.create :name => "screen_sharing_app"
    group04.recipes.create :name => "screen_sharing_on"
    group01.recipes.create :name => "selenium_webdriver"
    group04.recipes.create :name => "set_finder_show_all_hd_on_desktop"
    group04.recipes.create :name => "set_finder_show_hd_on_desktop"
    group04.recipes.create :name => "set_finder_show_user_home_in_sidebar"
    group04.recipes.create :name => "set_multitouch_preferences"
    group04.recipes.create :name => "set_screensaver_preferences"
    group03.recipes.create :name => "sizeup"
    group03.recipes.create :name => "skype"
    group01.recipes.create :name => "snmpd"
    group01.recipes.create :name => "solr"
    group09.recipes.create :name => "ssh_copy_id"
    group06.recipes.create :name => "sshd_on"
    group09.recipes.create :name => "ssl_certificate"
    group08.recipes.create :name => "sublime_text"
    group07.recipes.create :name => "svn"
    group04.recipes.create :name => "terminal_focus"
    group04.recipes.create :name => "terminal_preferences"
    group08.recipes.create :name => "textmate"
    group08.recipes.create :name => "textmate_bundles"
    group08.recipes.create :name => "textmate_plugins"
    group08.recipes.create :name => "textmate_preferences"
    group04.recipes.create :name => "timemachine_preferences"
    group06.recipes.create :name => "tmux"
    group06.recipes.create :name => "unix_essentials"
    group09.recipes.create :name => "user_owns_usr_local"
    group08.recipes.create :name => "vim"
    group03.recipes.create :name => "virtualbox"
    group04.recipes.create :name => "window_focus"
    group09.recipes.create :name => "workspace_directory"
    group03.recipes.create :name => "xquartz"
    group06.recipes.create :name => "zsh"
  end

end