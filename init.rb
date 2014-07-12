Redmine::Plugin.register :redmine_demo do
  name 'Redmine Demo plugin'
  author 'Haruyuki Iida'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://twitter.com/haru_iida'

  project_module :demo do
    permission :view_demo, {:demo => [:sample_action]}
  end

  menu :project_menu, :demo, { :controller => 'demo', :action => 'sample_action' }, :caption => :demo
end

#
#マクロ
#
Redmine::WikiFormatting::Macros.register do
  desc "Creates link to wikipedia page.\n\n" +
           " !{{wikipedia(string)}}\n"
  macro :wikipedia do |obj, args|

    return nil if args.length < 1
    target_string = args[0].strip

    link_to(h(target_string), "http://ja.wikipedia.org/wiki/#{target_string}").html_safe
  end
end
#
#view Hooks
#
class DemoHookViewListener < Redmine::Hook::ViewListener
  render_on :view_issues_new_top, :partial => "Demo/issue_note"
end

#
#controller Hooks
#
class DemoHookListener < Redmine::Hook::Listener
  def controller_issues_new_before_save(context = { })
    issue = context[:issue]
    issue.subject = "#{issue.subject}(嘘)"
  end
end

#
#alias_method_chain
#
#application_helper_patch.rb
require 'application_helper'
module ApplicationHelper
  def link_to_user_with_demo(*args)
    link_to_user_without_demo(*args) + "さん"
  end
  alias_method_chain :link_to_user, :demo
end
