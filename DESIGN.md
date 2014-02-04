Rust
====

The idea behind `Rust` (name changeable) is to add static-site-generator-like features to Rails, harnessing Gists as the core publishing mechanism. The end goal is to provide a framework around rendering the bodies of Gists as partials, with common drafting workflows enabled through rake and capistrano deploy strategies, a robust caching mechanism, live previews in development, and content editing + comment threads enabled through Gists.

Potential libraries
-------------------

- RedCarpet

  For markdown rendering

- Multimarkdown something something

  For tables and post metadata, possible interpolation

- Pygments

  For code block syntax highlighting

- Github API gem

  For communication w/Github gists

- OAuth gem

  To enable sophisticated Github Auth workflows

- Rake

  For common publishing tasks from the local development environment, and manual triggering of maintenance tasks like removing unreferenced content and rebuilding cached renders

- Thor

  If we want a fully-fledged custom terminal command

- Capistrano

  To augment workflow w/deploy logic

- Markdown.js

  For in-browser editing

Potential workflows
-------------------

- Draft locally

  Start writing a post in a local .gitignored drafts/ folder. Preview it live alongside all other posts. Publish it to gists locally. Does that publish in prod too?

- Draft remotely

  Start writing a post on gist.github.com, some special multi-markdown metadata hook or clever embedded-in-admin management console to publish?

- Draft live

  In-site md WYSIWYG editor?

- Draft sync

  Way of marshalling all of these together?

- Edit live

  At the least remotely on gist.github.com, perhaps in other envs too

- View comments

  Loaded from gist.com, onsite comment writing? Cool thing: requires a github account, automatic spam protection + commenter identity + comment moderation

- Moderate comments

  Through gist.github.com at least, anyones comments on your gists can be deleted or edited. Also allow scripted modding? Approval process (don't show on site, but will appear on gist.com)

- Authorize authors

  Allow other git accounts publishing and mod privileges on your site easily, doesn't even require cloning a copy of the repo, or potentially even entering gist.com once OAuthed w/the site.

- Authorize admins

  Mechanism for allowing admins to perform all moderation on all posts. Requires admin users using your OAuth creds to perform things for you, potentially dangerous and unwanted by authors

- Embed snippets

  Special syntax for auto-gisting certain code blocks within posts as their own gists, setting language, and compiling them back into posts with 'View on gist.com' link, monitoring for updates, syntax highlighting? OR could be implemented with multiple files per gist.

Considerations
--------------

The easiest way to bootstrap this is to focus on the remote gist.com environment first, from which we can build the local and live tooling. Also, most 'does this get published?', 'does this get put into a database?', and 'how does this authorization work?' questions can be solved with a thorough understanding of the gist.com workflow.

Visa-via the live on-site in-prod tools, such as author management, post publication, and handling/triggering scripted tasks, suggest an isolated mountable Rails engine as the platform for the gem.

Rake tasks make the most sense from the local repo-clone environment and will be deferred until that is underway.
