#!/usr/bin/perl

use strict;
use warnings;

use Dancer2;
use JSON ();

my $file = 'notes.json';

# =========================
# Load notes from file
# =========================
sub load_notes {

    open my $fh, '<', $file
        or die "Could not open $file: $!";

    local $/;

    my $json_text = <$fh>;

    close $fh;

    return @{ JSON::decode_json($json_text) };
}

# =========================
# Save notes to file
# =========================
sub save_notes {

    my ($notes_ref) = @_;

    open my $fh, '>', $file
        or die "Could not write to $file: $!";

    print $fh JSON::encode_json($notes_ref);

    close $fh;
}

# =========================
# GET /notes
# =========================
get '/notes' => sub {

    content_type 'application/json';

    my @notes = load_notes();

    return JSON::encode_json(\@notes);
};

# =========================
# POST /notes
# =========================
post '/notes' => sub {

    content_type 'application/json';

    my @notes = load_notes();

    my $data = request->body;

    my $note = JSON::decode_json($data);

    # Generate automatic ID
    my $new_id = 1;

    if (@notes) {
        $new_id = $notes[-1]{id} + 1;
    }

    $note->{id} = $new_id;

    push @notes, $note;

    save_notes(\@notes);

    status 201;

    return JSON::encode_json({
        message => 'Note created successfully',
        note    => $note
    });
};

# =========================
# PUT /notes/:id
# =========================
put '/notes/:id' => sub {

    content_type 'application/json';

    my @notes = load_notes();

    my $id = route_parameters->get('id');

    my $data = request->body;

    my $updated_note = JSON::decode_json($data);

    foreach my $note (@notes) {

        if ($note->{id} == $id) {

            $note->{text} = $updated_note->{text};

            save_notes(\@notes);

            return JSON::encode_json({
                message => 'Note updated successfully',
                note    => $note
            });
        }
    }

    status 404;

    return JSON::encode_json({
        error => 'Note not found'
    });
};

# =========================
# DELETE /notes/:id
# =========================
del '/notes/:id' => sub {

    content_type 'application/json';

    my @notes = load_notes();

    my $id = route_parameters->get('id');

    my $before = scalar @notes;

    @notes = grep { $_->{id} != $id } @notes;

    if (scalar @notes < $before) {

        save_notes(\@notes);

        return JSON::encode_json({
            message => 'Note deleted successfully'
        });
    }

    status 404;

    return JSON::encode_json({
        error => 'Note not found'
    });
};

start;